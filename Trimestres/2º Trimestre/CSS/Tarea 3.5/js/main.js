var instrucciones = document.querySelector("#instrucciones");

var principal = document.querySelector("#principal");
var t1 = document.querySelector("#t1");
var mensaje = "";


principal.addEventListener("mouseover", event => {
    let id = event.target.getAttribute("id");
    
    if( id === "t1" ) {
        mensaje = "Mueve el elemento unos píxeles tanto en el eje x como en el y.<br> translate(x,y)";
    } 
    else if( id === "t2" ) {
        mensaje = "Gira el elemento unos grados. En este caso se está girando 90 grados.<br> rotate(90deg)";
    }
    else if( id === "t3" ) {
        mensaje = "Redimiensiona o escala el elemento tanto en el eje x como en el y. Es como hacer un zoom.<br> scale(x,y)";
    }
    else if(id === "t4" ) {
        mensaje = "Inclina un elemento un número de grados.<br> skew(x,y)";
    }
    else if(id === "t5" ) {
        mensaje = "Las transformaciones se pueden combinar.<br> scale(x,y) rotate(Xdeg)";
    }
    else if(id === "t6" || id === "t7" || id === "t8" || id === "t9" || t10 === "t10" ) {
        mensaje = "Al añadir transiciones el efecto se puede hacer a la velocidad que marquemos.<br> transition: 5s";
    }
    else if( id === "efecto" || id === "descripcion" ) {
        instrucciones.innerHTML = mensaje;    
    }
    else {
        instrucciones.textContent = "Al pasar el ratón por encima, se pone el color poco a poco, con una transición. Al salir, el color se difumina poco a poco también.";
    }
    
    //instrucciones.textContent = mensaje;
    instrucciones.innerHTML = mensaje;
    return false;


/*
    instrucciones.textContent = "Al pasar el ratón por encima, se pone el color poco a poco, con una transición. Al salir, el color se difumina poco a poco también.";*/
})
principal.addEventListener("mouseout", event => {
    instrucciones.textContent = "";
})
/*
t1.addEventListener("mouseover", event => {
    instrucciones.textContent = "Mueve el elemento unos píxeles tanto en el eje x como en el y";
})
*/
