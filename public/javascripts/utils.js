function debug(){
    if (RAILS_ENV == 'production') {return;};
    if($.browser.mozilla){
        try{
            console.debug(arguments);
        } 
        catch(e){}
    }else if($.browser.safari){
        try{
            console.debug($.makeArray(arguments));
        }
        catch(e){}
    }else if($.browser.opera){
        try{
            window.opera.postError(arguments);
        }
        catch(e){}
    }else if($.browser.msie && $.browser.version == '8.0'){
        try{
            if(!console.debug){
                console.debug = iedebug;
            }
            console.debug(arguments);
        }catch(e){
        }
    }
}

function iedebug(){
    try{
        $.each(arguments, function(index, item){
            console.log("DEBUG["+index+"]: "+ item);
        });
    }catch(e){
        alert(e);
    };
}
