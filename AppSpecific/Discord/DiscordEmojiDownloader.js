const axios = require("axios");
const fs = require("fs");
const { promisify } = require("util");
const path = require("path");
const readFileAsync = promisify(fs.readFile);

// Read image URLs from file
// emoji_map.json is a json object like so:
// {
//   "emoji_name": "emoji_url",
// }
// I forgot how I generated it in the first place.
async function getImageUrlsFromFile() {
  try {
    const fileContent = await readFileAsync("emoji_map.json", "utf-8");
    const urls = JSON.parse(fileContent);
    return urls;
  } catch (error) {
    console.error("Error reading file:", error.message);
    return [];
  }
}

// Function to download each URL as a file
async function downloadFile(url, name) {
  try {
    const ext = path.extname(url);
    const response = await axios.get(url, { responseType: "arraybuffer" });
    const fileName = `images/${name}${ext}`;
    fs.writeFileSync(fileName, Buffer.from(response.data, "binary"));
    console.log(`Downloaded: ${fileName}`);
  } catch (error) {
    console.error(`Error downloading ${url}:`, error.message);
  }
}

// Fetch URLs from file and trigger download for each URL
async function fetchAndDownloadImages() {
  const emojiUlrs = await getImageUrlsFromFile();
  for (var image in emojiUlrs) {
    await downloadFile(emojiUlrs[image], image);
  }
}

// Execute the download process
fetchAndDownloadImages();
