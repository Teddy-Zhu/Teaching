/**
 * Created by teddyzhu on 2015/4/1.
 */
$(function () {
    $('#planSubmitToggle').bootstrapSwitch('size', 'small');

    $('#planSubmitToggle').bootstrapSwitch('onSwitchChange', function (e, data) {
        $('#planSubmitToggle').val(data ? 'on' : 'off');
    });
    $('#planSubmitToggle').val($(this).attr('data-open') == 1 ? 'on' : 'off');
    $('#planSubmitToggle').bootstrapSwitch('state', parseInt($('#planSubmitToggle').attr('data-open')) == 1 ? true : false);
})