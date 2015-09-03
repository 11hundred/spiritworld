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

});
