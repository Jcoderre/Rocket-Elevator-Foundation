fetch("https://bing-news-search1.p.rapidapi.com/news?safeSearch=Off&textFormat=Raw", {
	"method": "GET",
	"headers": {
		"x-bingapis-sdk": "true",
		"x-rapidapi-key": "02fcb00b00mshca77b871d58f815p1b82d4jsn385d5be92e0a",
		"x-rapidapi-host": "bing-news-search1.p.rapidapi.com"
	}
})
.then(response => {
	console.log(response);
})
.catch(err => {
	console.error(err);
});

module.exports = response;
