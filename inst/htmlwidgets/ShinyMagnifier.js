HTMLWidgets.widget({

  name: 'ShinyMagnifier',

  type: 'output',

  factory: function(el, width, height) {

    var main_div  = null;
    var param = null;
    var wid = null;
    var hei = null;

    return {
        
           renderValue: function(x) {
                //figuring out width and height in a way that redrawing works
                wid = wid === null ? width : wid;
                hei = hei === null ? height : hei;
        
                //remove everything in the element
                el.innerHTML = '';
                
                //add a new div
                this.main_div = d3.select(el)
                                .append("div")
                                .attr("class","main_div");
            
                //store the parameters
                this.param = x;
                
                //draw the images and previews 
                this.drawImage(this.main_div, this.param, wid, hei);
        },

        resize: function(width, height) {
            el.innerHTML = '';
            wid = width;
            hei = height;
            
            this.drawImage(this.main_div, this.param, wid, hei);
        },
        
        drawImage: function (main_div, params, wid, hei){
            
            var thumb = main_div.select('div')
                          .append("div")
                          .attr("class","magnifier-thumb-wrapper");
            thumb.select("div")
              .append("img")
              .attr("id","thumb")
              .attr("src",params.thumb);

            var full = main_div.select('div')
                         .append("div")
                         .attr("class","magnifier-preview")
                         .attr("id","preview")
                         .style("width", wid)
                         .style("height", hei)
                         .text(params.previewText);
            
            console.log(main_div);
            console.log(thumb);
            console.log(full);
            
            var evt = new Event();
            var m = new Magnifier(evt);
            m.attach({
                thumb: '#thumb',
                large: params.fullImage,    
                largeWrapper: 'preview'
                //zoom: 3
                //zoomable: true 
            });
        }
    };
  }
});

