function tambah(a, b) { 
hasil = a + b; 
return hasil; 
}  
var tambah = function (a, b) { 
hasil = a + b; 
return hasil; 
};
var tambah = function (a, b) { 
hasil = a + b; 
return hasil; 
};  
tambah(3, 5);
var simpan = tambah(3, 5); // simpan === 8  
tambah(simpan, 2);         // mengembalikan 10  
tambah(tambah(3, 5), 2)    // juga mengembalikan 10 
tambah(tambah(2, 3), 4)    // mengembalikan 9  

var naikkan = function (n) { 
    var hasil = n + 10; 
    return hasil;  
    
    // kode di bawah tidak akan dijalankan
    hasil = hasil * 100;  
};

console.log(naikkan(10)); // 20
console.log(naikkan(25)); // 35

var naikkan = function (n) {     
    return n + 10;  
};

var tambah = function (a, b) {     
    return a + b;  
};

console.log(tambah(4, 4));          // 8
console.log(naikkan(10));           // 20
console.log(tambah(naikkan(5), 7)); // 22