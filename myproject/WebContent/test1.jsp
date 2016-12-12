<!DOCTYPE html>
<html id=htmlText>
  <head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="http://www.xdocin.com/xdoc.js"></script>
  </head>
  <body>   
    <input type="button" onclick="gen1()" value="生成简历1"/>  
    <input type="button" onclick="gen2()" value="生成简历2"/>  
    <br/>  
    <script>     
        XDoc.run(document.getElementById("htmlText").value, "pdf", {}, "_blank");  
    </script>  
    <script>    
    function gen1() {  
        XDoc.run(document.getElementById("htmlText").value, "pdf", {}, "_blank");  
    }  
    function gen2() {  
        XDoc.run("./resume2.xdoc", "pdf", {_xdata:xdata}, "_blank");  
    }  
    </script>  
  </body>
</html>