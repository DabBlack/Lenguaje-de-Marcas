let elementos = document.querySelectorAll("#tiempo");
let precio = document.querySelectorAll("#precio");
//console.log(elementos);
let segundos = [];
let precios = [];

for(let i=0; i<elementos.length; i++) {
    segundos[i] = 700 + Math.floor(Math.random()*1000);
    precios[i] = 500 + Math.floor(Math.random()*500);
}

window.addEventListener("load", () => {
    elementos.forEach( (t, index) => {
        setInterval( () => {
            t.innerHTML = "<b>" + (segundos[index]--) + "</b>";
            //segundos[index]--;
        }, 1000);
    });
    precio.forEach( (p, index) => {
        p.innerHTML = precios[index] + " €";
    });
    
});

