# Imports
import gi
import sys
import os

gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gio

class MainWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self)
        self.set_border_width(100)

        self.headerbar = Gtk.HeaderBar()
        self.set_titlebar(self.headerbar)
        self.headerbar.show_all(True)
        self.headerbar.props.title = "Fresh Install Tool"

        self.aboutbutton = Gtk.Button()
        icon = Gio.ThemedIcon(name="open-menu-symbolic")
        image = Gtk.Image.new_from_gicon(icon, Gtk.IconSize.BUTTON)
        self.aboutbutton.add(image)
        self.headerbar.pack_end(self.aboutbutton)

        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
        self.add(vbox)

        self.button = Gtk.Button()
        self.button.set_halign(Gtk.Align.CENTER)
        self.button.set.valign(Gtk.Align.CENTER)
        self.button.set_size_request(75, 50)

        # self.grid = Gtk.Grid()
        # self.grid.set_column_spacing(6)
        # self.grid.set_halign(Gtk.Align.CENTER)
        # self.grid.set_valign(Gtk.Align.CENTER)

        

win = Gtk.Window()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
