# shoesly

**Shoesly** redefines shoe shopping with its sleek Flutter-based interface and comprehensive features. Seamlessly integrating Firebase for real-time data management, the app offers a streamlined experience from discovery to checkout. Users can effortlessly explore a vast array of footwear, filterable by top brands and preferences, while detailed product pages provide all essential information. With intuitive interfaces for managing carts, browsing reviews, and completing purchases, Shoesly ensures a hassle-free shopping journey. Advanced filter and sorting options cater to individual needs, while robust security measures guarantee a safe transaction process. Combining style, functionality, and convenience, Shoesly sets the benchmark for modern e-commerce platforms, delivering an unmatched experience for shoe enthusiasts worldwide.

## Project Setup

1. **Clone the repository:**

    ```bash
    git clone https://github.com/root137/shoesly.git
    cd shoesly
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run build runner to generate files:**

    ```bash
    dart run build_runner build
    ```

4. **Run the app:**

    ```bash
    flutter run
    ```

## Assumptions Made During Development

**Brands Collection:**

- Brand names and their respective logos/images are essential for product branding and visual representation.
- Each brand is uniquely identified by a brandId.

**Products Collection:**

- Products have various attributes such as name, price, description, colors, and sizes, facilitating detailed product listings.
- Images are stored as an array of URLs to provide multiple views of the product.
- Products are associated with a specific brand using the brandId field for brand identification.

**Reviews Collection:**

- Reviews contribute to product feedback and decision-making for users.
- Each review is linked to a specific product (productId) to maintain context and relevance.
- Reviews contain a rating, description, and creation date to provide comprehensive insights.

**Users Collection:**

- User profiles with names and profile picture URLs enhance the personalization and social aspects of the application.
- Each user is uniquely identified by a userId.

**Cart Collection:**

- User carts store information about the products added, including name, image URL, color, size, price, and quantity.
- Cart items reference both products and users, enabling efficient management and retrieval of cart data.

## Challenges Faced and Overcoming Strategies:**

**Data Modeling and Structuring with Firebase Riverpod:**
Implementing data modeling and structuring with Firebase Riverpod posed challenges, particularly in designing an efficient and scalable architecture for managing application state and data flow.

*Overcoming Strategy:*
To overcome this challenge, I started by thoroughly understanding the data requirements of the application and mapping out the relationships between different data entities. I utilized Firebase's NoSQL database capabilities to design a flexible and normalized data structure that could accommodate future scalability and changes in application requirements. Leveraging Riverpod for state management, I implemented providers to handle data fetching, caching, and synchronization with Firebase Firestore. By breaking down complex data structures into smaller, manageable units and utilizing Riverpod's state management capabilities effectively, I was able to create a robust and maintainable data model that facilitated seamless data flow throughout the application.

**Filtering Products Using Firebase:**
Implementing product filtering functionality using Firebase posed challenges due to the need to perform complex queries and efficiently retrieve filtered data based on various criteria such as brand, price range, and attributes.

*Overcoming Strategy:*
To address this challenge, I adopted a multi-step approach. Firstly, I optimized the data model by denormalizing certain data structures and pre-calculating aggregations to minimize the need for complex queries at runtime. Next, I utilized Firebase's querying capabilities, such as compound queries and array-contains, to efficiently filter products based on user-defined criteria. Additionally, I implemented client-side filtering using Riverpod to further refine and customize product filtering based on user interactions. By combining server-side and client-side filtering techniques, I achieved optimal performance and responsiveness in product filtering, ensuring a smooth user experience.

https://www.loom.com/share/24a0f4e26f5a4ee8b4257a4009852bdb?sid=0f7e2dcb-80ff-4f50-b3af-277936435388
