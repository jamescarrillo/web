/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$("#FrmAgendaDMA").submit(function () {
        $('#tbodyAgendaDMA').empty();
        $('#numberPageAgendaDMA').val("1");
        $('#actionAgendaDMA').val("paginarAgenda");
        $('#loader_contenidoDMA').css('display', 'block');
        procesarAjaxAgendaWeb("DMA");
        return false;
    });


