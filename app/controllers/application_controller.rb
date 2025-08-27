class ApplicationController < ActionController::Base
  # Removed: allow_browser versions: :modern
  # 
  # QuickDrop should work on ALL devices and browsers, not just "modern" ones.
  # A note-taking app blocking mobile browsers is counterproductive.
  # Users need to access their notes regardless of their browser choice.
end
