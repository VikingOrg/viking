/*!
 * CoreViking v0.1 (http://Jalastic.viking.com)
 * Copyright 2014-current Danil Ozherelyev
 * Licensed to ITT21
 */

function showProgressModal(selector) {
    $(selector).modal('show');
    $('.modal-backdrop').addClass('background-backdrop');
}

function closeProgressModal(selector) {
    $(selector).modal('hide');
}

