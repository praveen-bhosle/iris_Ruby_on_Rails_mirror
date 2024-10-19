NUMBER = 20

async function fetchFromDB() {
    spinner();
    // Fetch the local JSON file... apparently cannot do without fetch from browser
    fetch('response.json')
        .then(response => response.json())
        .then(data => articlesToDOM(data))
        .catch(error => {
            console.error('Error loading JSON:', error);
        });
    spinner();
}

async function fetchFromJS(query) {
    url = ''

    if (query) {
        console.log("Custom search")
        query = String(query)
        url = `https://newsapi.org/v2/everything?language=en&pageSize=${NUMBER}&q=${query}&apiKey=1b2fc2d4815b4d8d806df537115851e7`
    }
    else {
        console.log("Fetch top")
        url = `https://newsapi.org/v2/top-headlines?language=en&pageSize=${NUMBER}&apiKey=1b2fc2d4815b4d8d806df537115851e7`;
    }

    console.log("Waiting for search!")
    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`Response status: ${response.status}`);
        }

        const json = await response.json();
        console.log("Got results!")
        articlesToDOM(json)

    }
    catch (e) {
        console.error(e);
    }

}

function articlesToDOM(json) {
    const container = document.querySelector('.container');
    const articles = json.articles;
    let articleElements = []

    count = 0
    articles.forEach(article => {

        if (article.title === '[Removed]' || count >= 10) {
            return
        }

        // Article block for each article
        const articleDiv = document.createElement('div');
        articleDiv.className = 'article';

        // Title
        const title = document.createElement('h2');
        title.className = 'article-title';
        const endIndex = article.title.lastIndexOf('-')
        title.textContent = endIndex === -1 ? article.title : article.title.slice(0, endIndex);

        // Author and Source (if present)
        const authorSource = document.createElement('p');
        authorSource.className = 'article-author-source';
        authorSource.textContent = `${article.author || 'Unknown Author'} - ${article.source.name || 'Unknown Source'}`;

        // Image
        let image = undefined
        if (article.urlToImage) {
            image = document.createElement('img');
            image.className = 'article-image';
            image.src = article.urlToImage;
        }

        // Description
        const description = document.createElement('p');
        description.className = 'article-description';
        description.textContent = article.description;
        console.log(article.description)

        // Link to the full article
        const readMore = document.createElement('a');
        readMore.className = 'article-read-more';
        readMore.target = '_blank'
        readMore.href = article.url;
        readMore.textContent = 'Read More';

        // Append elements to the articleDiv
        articleDiv.appendChild(title);
        articleDiv.appendChild(authorSource);
        //if image doesn't exist, don't render
        image !== undefined ? articleDiv.appendChild(image) : (0);
        articleDiv.appendChild(description);
        articleDiv.appendChild(readMore);

        // Append each articleDiv to the container
        articleElements.push(articleDiv)
        count++;
    });

    container.replaceChildren(...articleElements);

}

async function handleSearch() {
    spinner();
    const searchBox = document.querySelector('.search-box');
    const query = searchBox.value;
    searchBox.value = ''
    const title = document.querySelector('.title-box');
    title.innerHTML = query === '' ? 'Top Headlines of the Day' : `You searched for: ${query}`
    await fetchFromJS(query)
    console.log("Everything done!")
    spinner();
}

function spinner() {
    const spinner = document.getElementById('spinner')
    console.log(spinner.classList)
    if (spinner.classList.contains('vanish')) {
        console.log("TRUE")
        spinner.classList.remove('vanish')
    }
    else {
        console.log("FALSE")
        spinner.classList.add('vanish')
    }
}

function keyToSearch(event) {
    if (event.key === "Enter") {
        document.querySelector(".search-button").click();
    }
}

document.querySelector('.search-button').addEventListener('click', handleSearch);
document.addEventListener("keypress", keyToSearch)
fetchFromDB()




