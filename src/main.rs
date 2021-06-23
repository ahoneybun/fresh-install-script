extern crate gtk;

use gtk::prelude::*; // Import all the basic things
use gtk::{Window, WindowType, Label};
use std::process::Command;

fn main() {
    if gtk::init().is_err() { //Initialize Gtk before doing anything with it
        panic!("Can't init GTK");
    }

    let window = Window::new(WindowType::Toplevel); 

    //Destroy window on exit
    window.connect_delete_event(|_,_| {gtk::main_quit(); Inhibit(false) });

    window.set_title("Fresh Install Tool");
    window.set_default_size(500, 350);
    let label = Label::new(Some("Let's walk though what software you want on this installation."));
    label.set_line_wrap(true);
    let button = gtk::Button::with_label("Update");
    
    button.connect_clicked(|_| {
        Command::new("gnome-terminal")
                .spawn()
                .expect("GNOME Terminal failed to start");
    });

    let layout = gtk::Box::new(gtk::Orientation::Vertical, 5);

    layout.add(&label);
    layout.add(&button);
    window.add(&layout);
    window.show_all();
    gtk::main();
}