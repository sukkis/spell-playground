fn greet_user(name: Option<String>) {
    match name {
        Some(name) => println!("Hello {}", name),
        None => println!("Howdy, stranger!"),
    }
}

fn main() {
    greet_user(Some("Pete".to_string()));
    greet_user(None);
}
