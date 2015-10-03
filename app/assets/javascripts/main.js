jQuery(document).ready(function($) {

  $('input#post_is_podcast').click(function() {
    var isPodcastWrap = $('.is-podcast-wrap');
    var requiredPodcastFields = isPodcastWrap.find('input#post_audio_file_url, input#post_episode_id');
    if ($(this).prop('checked')) {
      isPodcastWrap.addClass('true');
      isPodcastWrap.find('input, textarea').not('#post_show_notes').attr('disabled', false);
      requiredPodcastFields.attr('required', true);
    } else {
      isPodcastWrap.removeClass('true');
      requiredPodcastFields.attr('required', false);
    }
  });

  $('input#post_show_notes_match_content').click(function() {
    var showNotesWrap = $('.show-notes-match-content-wrap');
    var showNotesTextarea = showNotesWrap.find('textarea');
    if ($(this).prop('checked')) {
      showNotesWrap.removeClass('false');
    } else {
      showNotesWrap.addClass('false');
      showNotesTextarea.attr('disabled', false);
    }
  });

  $('.insert-time-button').click(function(e) {
    e.preventDefault();
    if ($(this).hasClass('insert-beginning')) {
      $('#post_event_time_start').val($(this).data('time'));
    } else if ($(this).hasClass('insert-last-end')) {
      $('#post_event_time_start').val($(this).data('time'));
    } else if ($(this).hasClass('insert-end')) {
      $('#post_event_time_end').val($(this).data('time'));
    }
  });

});

function calculateAudioLength(audioPlayer, buttonTarget) {
  var podcastRawSeconds = audioPlayer.duration;
  var podcastHours = Math.floor(podcastRawSeconds / 3600);
  var podcastMinutes = Math.floor((podcastRawSeconds - (podcastHours * 3600)) / 60);
  var podcastSeconds = Math.floor((podcastRawSeconds - (podcastHours * 3600)) % 60);
  var podcastLengthHMS = padTimeBlock(podcastHours) + ':' + padTimeBlock(podcastMinutes) + ':' + padTimeBlock(podcastSeconds);
  buttonTarget.data('time', podcastLengthHMS).attr('title', 'End (' + podcastLengthHMS + ')');
}

function padTimeBlock(string) {
  string = string.toString();
  return string.length < 2 ? padTimeBlock('0' + string) : string;
}
