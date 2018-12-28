function dynamicThumbnail(url) {
    $.each(url, function(key, data) {
        var onReady = function(img, downloadUrl) {
            img.attr("src", downloadUrl);
            //console.log(downloadUrl);
            img.on("error", function() {
                onError(img);
            });
        };

        var onError = function(img) {
            img.attr("src", _global.baseUrl + "/img/not-available.png");
        };

        var image = $('#thumb_'+key);
        if(_global.proxyImage === 1) {
            var pp = new PagePeekerHelper(image, data, onReady, onError);
            pp.poll();
        } else {
            onReady(image, data.thumb);
        }
    });
}

$(document).ready(function(){
    $("a.disabled, li.disabled a").click(function(){
        return false;
    })
});

// Constructor
function PagePeekerHelper(image, data, onReady, onError) {
    $.ajaxSetup({ cache: false });
    this.proxy = _global.baseUrl+'/index.php/proxy';
    this.data = data;
    this.onReady = onReady;
    this.onError = onError;
    this.image = image;
    this.pollTime = 20; // In seconds
    this.execLimit = 3; // If after x requests PP willn't response with status "Ready", then clear interval to avoid ddos attack.
}

PagePeekerHelper.prototype.poll = function() {
    var self = this,
        size = this.data.size || 'm',
        url = this.data.url || '',
        proxyReset = this.proxy + "?" + $.param({
            size: size,
            url: url,
            method: 'reset'
        }),

        proxyPoll = this.proxy + "?" + $.param({
            size: size,
            url: url,
            method: 'poll'
        }),
        limit = this.execLimit,
        i = 0,
        isFirstCall = true;

    // Flush the image
    $.get(proxyReset, function() {
        //console.log("Reseting " + url);

        var pollUntilReady = function(cb) {
            //console.log("Polling " + url + " " + (i + 1) + " times");

            $.getJSON(proxyPoll, function(data) {
                //console.log("Received", data);
                var isReady = data.IsReady || 0;
                if(isReady) {
                    //console.log("The " + url + " is ready: " + isReady);
                    self.onReady.apply(self, [self.image, self.data.thumb]);
                    return true;
                }
                cb();
            }).fail(function() {
                //console.log('Failed to request local proxy script. Clearing the timeout');
                self.onError.apply(self, [self.image]);
            });
        };


        (function pollThumbnail() {
            var timeout = isFirstCall ? 0 : self.pollTime * 1000;
            setTimeout(function() {
                pollUntilReady(function() {
                    //console.log("Async " + url + " has done");
                    isFirstCall = false;
                    i++;
                    if(i < limit) {
                        pollThumbnail();
                    } else {
                        //console.log("Reached limit of reuqests for " + url);
                        self.onError.apply(self, [self.image]);
                    }
                });
            }, timeout);
        })();

    }).fail(function() {
        self.onError.apply(self, [self.image]);
    });
};