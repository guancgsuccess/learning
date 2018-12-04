function choiceAnswer(that) {
    var radion1 = document.getElementById("jsCpn_2_checkbox_0");
    var radion2 = document.getElementById("jsCpn_3_checkbox_1");
    var radion3 = document.getElementById("jsCpn_4_checkbox_2");
    var radion4 = document.getElementById("jsCpn_5_checkbox_3");
    var radioId = that.parentNode.id;
    var spans = document.getElementsByName(that.getAttribute("name"));
    that.setAttribute("class","icons span-selected");
    for(var i=0;i<4;i++){
        if(spans[i]!=that){
            spans[i].setAttribute("class","icons");
        }
    }
}

function getAnswer(that) {
    var questionNum = that.previousSibling.previousSibling.id;
    var questionPaperId = that.nextSibling.nextSibling.id;
    var result = "";
    for(var i=1;i<=questionNum;i++){
        var spanName = "span"+i;
        var spans = document.getElementsByName(spanName);
        var flag = "icons span-selected";
        var result2 = result;
        for(var j=0;j<4;j++){
            if(spans[j].getAttribute("class")==flag){
                if(j==0){
                    result += "A";
                    break;
                }
                if(j==1){
                    result += "B";
                    break;
                }
                if(j==2){
                    result += "C";
                    break;
                }
                if(j==3){
                    result += "D";
                    break;
                }
            }
        }
        if(result==result2){
            result += "E";
        }
    }
    if(result.indexOf("E")!=-1){
        if( confirm("还有题目没有做答，你确定要交卷吗？")){
            var use_time = document.getElementById("use-time").value;
            var putAnswer = "/questionbank/submitanswer/"+result+"/"+questionPaperId+"/"+use_time;
            window.location = putAnswer;
        }
    }else {
        var use_time = document.getElementById("use-time").value;
        var putAnswer = "/questionbank/submitanswer/"+result+"/"+questionPaperId+"/"+use_time;
        window.location = putAnswer;
    }
}
