use rand::Rng;
use std::cmp::Ordering;
use std::io;

fn main() {
    println!("Welcome to guessing game!");

    let _secret_number = rand::thread_rng().gen_range(1..=100);

    loop {
        let mut guess = String::new();
        println!("Guess a number between 1 and 100: ");
        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line.\n");
        // trim - removes whitespace and e.g. "\n"
        // parse - change type to u32
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            // with continue we give another try if user passes crap
            Err(_) => continue,
        };

        println!("Your guess: {}", guess);

        match guess.cmp(&_secret_number) {
            Ordering::Less => println!("Too low!"),
            Ordering::Greater => println!("Too high!"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        }
    }
}
