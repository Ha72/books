AdminUser.delete_all
Genre.delete_all

# create 5 genres
genre_1 = Genre.create(genre: "Children Book")
genre_2 = Genre.create(genre: "Science")
genre_3 = Genre.create(genre: "Fiction")
genre_4 = Genre.create(genre: "Health")
genre_5 = Genre.create(genre: "Mystery")

# create books
book_1 = genre_1.books.create(
    title: "Harry Potter Box Set",
    author: "J.K. Rowling",
    description: "A beautiful boxed set containing all seven Harry Potter novels in paperback. These new editions of the classic and internationally bestselling, multi-award-winning series feature instantly pick-up-able new jackets by Jonny Duddle, with huge child appeal, to bring Harry Potter to the next generation of readers.",
    price: 63.29,
    stock_quantity: 20,
    status: "recently updated"    
)

book_2 = genre_2.books.create(
    title: "Glider Attack",
    author: "R.J. Furness",
    description: "As champion orgo racers, Fayth, Ink and Megg were chosen to transport food supplies. But they had no idea how much danger they faced. Join them on their second mission to Scorr Tanta. Along the way, they are ambushed by a mob of greedy gliders from Eklips territory.",
    price: 7.99,
    stock_quantity: 6,
    status: "new"    
)

book_3 = genre_3.books.create(
    title: "Milk and Honey",
    author: "Rupi Kaur",
    description: "#1 New York Times bestseller milk and honey is a collection of poetry and prose about survival. About the experience of violence, abuse, love, loss, and femininity. The book is divided into four chapters, and each chapter serves a different purpose. Deals with a different pain. Heals a different heartache. milk and honey takes readers through a journey of the most bitter moments in life and finds sweetness in them because there is sweetness everywhere if you are just willing to look.",
    price: 14.85,
    stock_quantity: 12,
    status: "on sale"    
)

book_4 = genre_4.books.create(
    title: "Untamed",
    author: "Glennon Doyle",
    description: "#1 NEW YORK TIMES BESTSELLER • “Packed with incredible insight about what it means to be a woman today.”—Reese Witherspoon (Reese’s Book Club x Hello Sunshine Book Pick). In her most revealing and powerful memoir yet, the activist, speaker, bestselling author, and “patron saint of female empowerment” (People) explores the joy and peace we discover when we stop striving to meet others’ expectations and start trusting the voice deep within us.",
    price: 25.36,
    stock_quantity: 3,
    status: "new"    
)

book_5 = genre_5.books.create(
    title: "Crossroads",
    author: "Dianna Wilkes",
    description: "He's tired of running. She's looking for an escape. Can they find a home together? Joshua Canfield spent the last year hiding from killers. He’s done things he can never confess, especially not to the loved ones he was protecting. All he wants now is to reunite with his family and live a peaceful life. ",
    price: 11.86,
    stock_quantity: 6,
    status: "recently updated"    
)

# create admin
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
