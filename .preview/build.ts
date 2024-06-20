import fs from "fs";

const tokens = fs.readdirSync("tokens");

const EXCLUDE = ["dai.png", "kdk.png", "tether.png", "yeet.png"];

const buildHtml = (directory: string, filename: string) => {
    if (EXCLUDE.includes(filename) || !filename.endsWith(".png")) {
        return;
    }
    const kodiakId = `https://static.kodiak.finance/${directory}/${filename}`;
    const berachainId = `https://artio-static-asset-public.s3.ap-southeast-1.amazonaws.com/assets/${filename}`;
    return `
        <div class="i_w">
            <img id="${kodiakId}" src="${kodiakId}" class="i" src="">
            <div class="i_d" id="${kodiakId}_desc"></div>
        </div>
        <div class="i_w">
            <img id="${berachainId}" src="${berachainId}" class="i" src=""/>
            <div class="i_d" id="${berachainId}_desc"></div>
        </div>
    `;
};

const html = tokens
    .map((token) => buildHtml("tokens", token))
    .filter(Boolean)
    .join("");

const content = fs
    .readFileSync(".preview/template.html")
    .toString()
    .replace("<!-- CONTENT -->", html);

fs.writeFileSync("index.html", content);
