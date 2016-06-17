import os, sublime, sublime_plugin

class BlameCommand(sublime_plugin.TextCommand):

  def __init__(self, view):
    self.view = view
    self.settings = self.settings()

  def run(self, view):
    file_name = self.view.file_name()
    path = os.path.splitdrive(file_name)
    github_url = self.settings.get("url")
    sublime.set_clipboard(github_url + path[1])
    sublime.status_message("Path copied to clipboard")

  def settings(self):
    return sublime.load_settings("Settings.sublime-settings")

  def is_enabled(self):
    return bool(self.view.file_name() and len(self.view.file_name()) > 0)
