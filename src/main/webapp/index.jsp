<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Library Management System</title>
    <style>
        /* Root Variables for Blue-Themed Colors */
        :root {
            --primary-color: #1a1f71; /* Navy Blue for Headers */
            --secondary-color: #f0f4fb; /* Light Blue for Background */
            --accent-color: #4a6fa5; /* Medium Blue for Buttons */
            --button-hover-color: #36588c; /* Darker Blue for Button Hover */
            --text-color: #ffffff; /* White for Text */
            --card-background: #e3eaf5; /* Lighter Blue for Cards */
            --border-color: #d1d9e6; /* Light Grayish Blue for Borders */
            --link-color: #1a73e8; /* Light Blue for Links */
            --link-hover-color: #0d47a1; /* Dark Blue for Link Hover */
            --dark-background: #121212; /* Dark mode background */
            --dark-text: #e0e0e0; /* Dark mode text */
        }

        /* General Body Styles */
        body {
            background-color: var(--secondary-color);
            color: var(--primary-color);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            transition: background-color 0.3s, color 0.3s;
        }

        body.dark-mode {
            background-color: var(--dark-background);
            color: var(--dark-text);
        }

        /* Navigation Bar */
        nav {
            background-color: var(--primary-color);
            color: var(--text-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 30px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        nav h1 {
            font-size: 24px;
        }

        nav ul {
            list-style: none;
            display: flex;
        }

        nav ul li {
            margin-left: 20px;
        }

        nav ul li a {
            color: var(--text-color);
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: var(--link-color);
        }

        /* Main Container */
        .main-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            padding: 20px;
        }

        /* Dashboard Cards */
        .card {
            background-color: var(--card-background);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 20px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card h2 {
            color: var(--primary-color);
            margin-bottom: 10px;
            font-size: 22px;
        }

        .card p {
            color: var(--primary-color);
            margin-bottom: 20px;
            font-size: 16px;
        }

        .card a {
            background-color: var(--accent-color);
            color: var(--text-color);
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .card a:hover {
            background-color: var(--button-hover-color);
        }

        /* Footer */
        footer {
            background-color: var(--primary-color);
            color: var(--text-color);
            text-align: center;
            padding: 15px 0;
            margin-top: auto;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Dark Mode Styles */
        body.dark-mode .card {
            background-color: #1e1e1e;
            color: var(--dark-text);
        }

        body.dark-mode nav {
            background-color: #1e1e1e;
        }

        body.dark-mode footer {
            background-color: #1e1e1e;
        }

        /* Language and Dark Mode Toggle */
        .language-select, #dark-mode-toggle {
            margin: 10px;
            padding: 8px 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .language-select {
            background-color: var(--accent-color);
            color: var(--text-color);
        }

        .language-select:hover {
            background-color: var(--button-hover-color);
        }

        #dark-mode-toggle {
            background-color: var(--accent-color);
            color: var(--text-color);
        }

        #dark-mode-toggle:hover {
            background-color: var(--button-hover-color);
        }

        /* Advanced Search Form */
        #advanced-search-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        #advanced-search-form input, #advanced-search-form select {
            margin: 5px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid var(--border-color);
            font-size: 16px;
        }

        #advanced-search-form button {
            background-color: var(--accent-color);
            color: var(--text-color);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #advanced-search-form button:hover {
            background-color: var(--button-hover-color);
        }

        /* Book of the Day Section */
        #book-of-the-day {
            margin-top: 20px;
            text-align: center;
        }

        #book-of-the-day h3 {
            color: var(--primary-color);
        }

        #book-of-the-day p {
            color: var(--primary-color);
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav>
        <h1>Library Management System</h1>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="BookRegister.jsp">Add Book</a></li>
            <li><a href="Booklist.jsp">View Books</a></li>
             <li><a href="update.jsp">Update</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
        <button id="dark-mode-toggle">Dark Mode</button>
        <select id="language-select" class="language-select">
            <option value="en">English</option>
            <option value="es">Spanish</option>
            <option value="fr">French</option>
            <!-- Add more languages as needed -->
        </select>
    </nav>

    <!-- Main Content Container -->
    <div class="main-container">
        <!-- Welcome Message -->
        <div class="card">
            <h2>Welcome to Your Library</h2>
            <p>Manage your books efficiently with our system.</p>
            <a href="BookRegister.jsp">Add a New Book</a>
        </div>

        <!-- Browse Books Card -->
        <div class="card">
            <h2>Browse Books</h2>
            <p>Explore the collection of books available in the library.</p>
            <a href="Booklist.jsp">View Book List</a>
        </div>
        <!-- Contact Us Card -->
        <div class="card">
            <h2>Need Help?</h2>
            <p>Contact us for any queries or support related to the system.</p>
            <a href="contact.jsp">Contact Us</a>
        </div>

        <!-- Advanced Search Form -->
        <div class="card">
            <h2>Advanced Search</h2>
            <form id="advanced-search-form">
                <input type="text" id="search-query" placeholder="Enter search term..." required>
                <select id="search-filter">
                    <option value="title">Title</option>
                    <option value="author">Author</option>
                    <option value="genre">Genre</option>
                </select>
                <button type="submit">Search</button>
            </form>
        </div>

        <!-- Book of the Day -->
        <div id="book-of-the-day" class="card">
            <h3 id="book-of-the-day-title">Book of the Day</h3>
            <p id="book-of-the-day-author"></p>
            <p id="book-of-the-day-description"></p>
            <a id="book-of-the-day-link" href="#">Learn More</a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Library Management System. All rights reserved by Jagruti.</p>
    </footer>

    <!-- JavaScript -->
 <script>
    // Dark Mode Toggle
    function toggleDarkMode() {
        document.body.classList.toggle('dark-mode');
        const darkModeButton = document.getElementById('dark-mode-toggle');
        const isDarkMode = document.body.classList.contains('dark-mode');

        // Update button text based on current mode
        if (darkModeButton) {
            darkModeButton.innerText = isDarkMode ? 'Light Mode' : 'Dark Mode';
        }

        // Save preference to localStorage
        localStorage.setItem('darkMode', isDarkMode);
    }

    // Function to fetch book of the day details
    function fetchBookOfTheDay() {
        // Example of fetching data from a mock API or server
        const bookOfTheDay = {
            title: "The Great Gatsby",
            author: "F. Scott Fitzgerald",
            description: "A novel set in the 1920s that examines the themes of wealth, society, and the American dream.",
            link: "bookDetails.jsp?bookId=1"
        };

        // Update the book of the day details on the page
        const bookOfTheDayTitle = document.getElementById('book-of-the-day-title');
        const bookOfTheDayAuthor = document.getElementById('book-of-the-day-author');
        const bookOfTheDayDescription = document.getElementById('book-of-the-day-description');
        const bookOfTheDayLink = document.getElementById('book-of-the-day-link');

        if (bookOfTheDayTitle) {
            bookOfTheDayTitle.innerText = bookOfTheDay.title;
        }
        if (bookOfTheDayAuthor) {
            bookOfTheDayAuthor.innerText = `by Rs{bookOfTheDay.author}`;
        }
        if (bookOfTheDayDescription) {
            bookOfTheDayDescription.innerText = bookOfTheDay.description;
        }
        if (bookOfTheDayLink) {
            bookOfTheDayLink.href = bookOfTheDay.link;
        }
    }

    // Load dark mode preference on page load
    document.addEventListener('DOMContentLoaded', () => {
        const savedDarkMode = localStorage.getItem('darkMode') === 'true';
        if (savedDarkMode) {
            document.body.classList.add('dark-mode');
            const darkModeButton = document.getElementById('dark-mode-toggle');
            if (darkModeButton) {
                darkModeButton.innerText = 'Light Mode';
            }
        }

        // Dark mode toggle button event listener
        const darkModeButton = document.getElementById('dark-mode-toggle');
        if (darkModeButton) {
            darkModeButton.addEventListener('click', toggleDarkMode);
        }

        // Language selection event listener
        const languageSelect = document.getElementById('language-select');
        if (languageSelect) {
            languageSelect.addEventListener('change', (event) => {
                const selectedLanguage = event.target.value;
                alert(`Language changed to: ${selectedLanguage}`);
                // Implement language change logic here
            });
        }

        // Advanced search submission
        const searchForm = document.getElementById('advanced-search-form');
        if (searchForm) {
            searchForm.addEventListener('submit', (event) => {
                event.preventDefault();
                const query = document.getElementById('search-query').value;
                const filter = document.getElementById('search-filter').value;
                alert(`Search Query: ${query} | Filter: ${filter}`);
                // Implement search functionality here
            });
        }

        // Call function to fetch book of the day
        fetchBookOfTheDay();
    });
</script>

</body>
</html>

