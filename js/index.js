
import fs from 'fs'
import path from 'path'
import config from '../static-doc/config.json'

const DEST = './CONTENT.md'
const docFilesPath = '../'

const read = file => new Promise((resolve, reject) =>
  fs.readFile(path.join(process.cwd(), docFilesPath, file), 'utf8', (err, data) => err ? reject(err) : resolve(data)))

const write = (dest, content) => new Promise((resolve, reject) =>
  fs.writeFile(dest, content, err => err ? reject(err) : resolve()))

Promise.all(config.map(read))
  .then(sections => sections.join('\n'))
  .then(content => write(DEST, content))
  .catch(e => console.log(e))
