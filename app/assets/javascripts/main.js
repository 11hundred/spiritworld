var singleAudioPlayer;
var singleAudioPlayerInterval;

jQuery(document).ready(function($) {

  addEditLinkActions();

  singleAudioPlayer = $('#single-audio-player')[0];
  if (singleAudioPlayer) {
    singleAudioPlayer.onplay = function() {
      setInterval(function() {
        checkAudioStage(singleAudioPlayer);
      }, 1000);
    };
  }

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

function applyPostEventTimeButtonActions() {
  $('.insert-time-button').click(function(e) {
    var dummyAudioPlayer = $('#audio-podcast-dummy')[0];
    e.preventDefault();
    if ($(this).hasClass('insert-beginning')) {
      $('#post_event_time_start').val($(this).data('time'));
    } else if ($(this).hasClass('insert-last-end')) {
      $('#post_event_time_start').val($(this).data('time'));
    } else if ($(this).hasClass('insert-end')) {
      $('#insert-end-button').data('time', calculateAudioLength(dummyAudioPlayer)).attr('title', 'End (' + calculateAudioLength(dummyAudioPlayer) + ')');
      $('#post_event_time_end').val($('#insert-end-button').data('time'));
    }
  });
}

function checkAudioStage(singleAudioPlayer) {
  var audioCurrentTime = Math.floor(singleAudioPlayer.currentTime);
  $('.post-events-stage .post-events-list li').each(function() {
    var thisLI = $(this);
    if (thisLI.data('time-start') == audioCurrentTime) {
      thisLI.addClass('active');
    }
    if (thisLI.data('time-end') <= audioCurrentTime) {
      thisLI.fadeOut().removeClass('active');
    }
  });
}

function calculateAudioLength(audioPlayer, buttonTarget) {
  var podcastRawSeconds = audioPlayer.duration;
  var podcastHours = Math.floor(podcastRawSeconds / 3600);
  var podcastMinutes = Math.floor((podcastRawSeconds - (podcastHours * 3600)) / 60);
  var podcastSeconds = Math.floor((podcastRawSeconds - (podcastHours * 3600)) % 60);
  var podcastLengthHMS = padTimeBlock(podcastHours) + ':' + padTimeBlock(podcastMinutes) + ':' + padTimeBlock(podcastSeconds);
  return podcastLengthHMS;
}

function padTimeBlock(string) {
  string = string.toString();
  return string.length < 2 ? padTimeBlock('0' + string) : string;
}

function addEditLinkActions() {
  $('.edit-post-event-link').click(function() {
    tinyMCE.execCommand('mceRemoveEditor', true, 'post_event_content');
  });
}

function gup(name, url) {
  if (!url) url = location.href;
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec( url );
  return results === null ? null : results[1];
}
