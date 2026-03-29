$(document).ready(function() {

    $('#tombolCek').on('click', function() {
        let acak = Math.floor(Math.random() * 100) + 1;
        let hasil = "";

        if (acak <= 35) {
            hasil = "Rp 20.000";
        } else if (acak <= 60) {
            hasil = "Rp 10.000";
        } else if (acak <= 75) {
            hasil = "Rp 50.000";
        } else if (acak <= 87) {
            hasil = "Rp 5.000";
        } else if (acak <= 97) {
            hasil = "Rp 2.000";
        } else {
            hasil = "Rp 100.000";
        }

        $('#hasilNominal').text(hasil);
        $('#modalThr').css('display', 'flex').hide().fadeIn(300);
    });

    function tutup() {
        $('#modalThr').fadeOut(200);
    }

    $('#closeX').on('click', function() {
        tutup();
    });

    $('#btnSelesai').on('click', function() {
        tutup();
    });

    $(window).on('click', function(e) {
        if ($(e.target).is('#modalThr')) {
            tutup();
        }
    });

});