extern crate gtk;

use gtk::prelude::*; // Import all the basic things
use gtk::{Window, WindowType, Label};

fn main() {
    if gtk::init().is_err() { //Initialize Gtk before doing anything with it
        panic!("Can't init GTK");
    }

    let window = Window::new(WindowType::Toplevel); 

    //Destroy window on exit
    window.connect_delete_event(|_,_| {gtk::main_quit(); Inhibit(false) });

    window.set_title("Fresh Install Tool");
    window.set_default_size(500, 350);
    let label = Label::new(Some("Let's walk though what software you want on this installation. First we'll make sure your sources are up to date."));
    label.set_line_wrap(true);
    let button = gtk::Button::with_label("Browsers");
    // button.connect_clicked(

    // )

    let button2 = gtk::Button::with_label("Graphics");

    let layout = gtk::Box::new(gtk::Orientation::Vertical, 5);

    layout.add(&label);
    layout.add(&button);
    layout.add(&button2);
    window.add(&layout);
    window.show_all();
    gtk::main();
}