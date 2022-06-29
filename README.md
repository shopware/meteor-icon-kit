[![npm version](https://badge.fury.io/js/@shopware-ag%2Fmeteor-icon-kit.svg)](https://badge.fury.io/js/@shopware-ag%2Fmeteor-icon-kit)

# meteor-icon-kit

> An icon library and toolkit that follows a minimal, yet highly expressive style perfectly aligned with Shopware's product language

## Prerequisites

This project requires `npm` or `yarn`.
[npm](http://npmjs.org/) and [yarn](https://yarnpkg.com/) are really easy to install.
To make sure you have one of them available on your machine,
try running the following command. This project itself was created with `npm`.

```sh
$ npm -v
8.1.0

$ yarn -v
1.22.15
```

## Table of contents

- [meteor-icon-kit](#meteor-icon-kit)
  - [Prerequisites](#prerequisites)
  - [Table of contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Built With](#built-with)
  - [Figma library](#figma-library)
  - [License](#license)

## Installation

**BEFORE YOU INSTALL:** please read the [prerequisites](#prerequisites)

To install the meteor-icon-kit, run:

```sh
$ npm install @shopware-ag/meteor-icon-kit
```

Or if you prefer using Yarn:

```sh
$ yarn add @shopware-ag/meteor-icon-kit
```

## Usage

Start by importing the icon you would like:
```js
import wallet from '@shopware-ag/meteor-icon-kit/icons/regular/wallet.svg';
```

### Dynamic colors

Take this pseudo html:
```html
<span class="icon-example">
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
    <!--- ... -->
    </svg>
</span>
```

By defining the following class structure in `CSS` you can change the color of the svg dynamically:
```CSS
.icon-example {
  display: block;
  color: green;
  
  svg {
    fill: currentColor;

    path,
    use {
      fill: currentColor;
    }
  }
}
```

## Built With

* Typescript
* Figma API
* VS-Code
* Love :blue_heart: :blue_heart: :blue_heart:

## Figma library
Meteor Icon Kit is available as a [Figma library](https://www.figma.com/community/file/1032564947404478461/Meteor-Icon-Kit-%E2%80%93-Shopware) through the Figma Community. To use the icons, log in to your Figma account and duplicate the file to your drafts.

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT). 

2022 © shopware AG