import chatarea_channel from "../channels/chatareas_channel";

$(document).on("turbolinks:load", () => {
    scrollToBottom("chat-area-section");
    $("#new_message").on("keypress", e => {
        if (e && e.keyCode == 13) {
            e.preventDefault();
            if($(e.target).val().length > 0) {
                $("#new_message").submit()
            }
        }
    });

    $("#new_message_submit_btn").on("click", e => {
        e.preventDefault()
        $("#new_message").submit()
    });

    $("#new_message").on("submit", e => {
        e.preventDefault()
        let chatareaId = $("[data-behaviour='messages']").data('chatarea-id');
        let body = $("#message_body")
        chatarea_channel.speak(chatareaId, body.val());
        body.val("")
    });

    $("#exit-from-channel").on("click", e => {
        e.preventDefault();
        let chatareaId = $("#exit-from-channel").data('chatarea-id');
        console.log("removing")
        fetch(`/chatareas/${chatareaId}/chatarea_user`, {method: "DELETE"})
    });
});

function scrollToBottom(id) {
    let scrollEl = $("#" + id);

    if ($(scrollEl).length > 0) {
        scrollEl.animate({
            scrollTop: scrollEl.get(0).scrollHeight
        }, 100);
    }
}