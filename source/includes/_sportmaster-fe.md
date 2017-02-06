# Sportmaster rendering layer
## Introduction

This project was bootstrapped with [Create React App](https://github.com/facebookincubator/create-react-app).

It contains:
*     webpack with webpack-dev-server, html-webpack-plugin and style-loader
*     Babel with ES6 and extensions used by Facebook (JSX, object spread, class properties)
*     Autoprefixer
*     ESLint
*     Jest
*     and others.

**Be aware:** package.json do not contain these dependencies, they will appear after running `npm run eject` as well as webpack/babel settings and build scripts. Read more [here](../Available-Scripts). 

## Available scripts

In the project directory, you can run:

`npm start`

Runs the app in the development mode.
Open http://localhost:3000 to view it in the browser.

The page will reload if you make edits.
You will also see any lint errors in the console.

`npm run eject`

Note: this is a one-way operation. Once you eject, you can’t go back!

If you aren’t satisfied with the build tool and configuration choices, you can eject at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (Webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except eject will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use eject. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

## Folder structure

> Default folder structure:

```
    app/
      README.md
      node_modules/
      package.json
      .gitignore
    public/
      index.html
      favicon.ico
    src/
      actions/
      components/
      constants/
      containers/
        App.js
        Root.js
      reducers/
        Root.js
      routes/
        Root.js
      configureStore.js
      index.js
```

For the project to build, these files must exist with exact filenames:

    public/index.html is the page template;
    src/index.js is the JavaScript entry point.

**scr/actions:**

    Contains action creators for both API and internal requests.

Read more [here](../Action-creators).

**src/components:**

    Should contain stateless react component with no data manipulation or extra functionality.

**src/constants:**

    All custom string should be stored here. Preferably grouped by reducers or other usage in different files.

**src/containers:**

    Should contain react components.

    src/containers/Root.js - basic redux provider's wrapper. This file should be never changed.
    src/containers/App.js - redux connector, which allow bind actions and states for external usage(child components).

**src/reducers:**

    Should contain react state reducers.

    src/reducers/Root.js - combine all sub reducers and map their states.

**src/routes:**

    Should contain react routes.

    src/routes/Root.js - combine children routes to one object.

## Action creators

### Library: Redux Thunk

[redux-trunk](https://github.com/gaearon/redux-thunk)

Redux Thunk [middleware](https://github.com/reactjs/redux/blob/master/docs/advanced/Middleware.md) allows you to write action creators that return a function instead of an action. The thunk can be used to delay the dispatch of an action, or to dispatch only if a certain condition is met. The inner function receives the store methods `dispatch` and `getState` as parameters.

> Usage example:

```Javascript
export const actionName = payload => (dispatch, getState) => {
  // Code goes here.
};
```

Also this enable to dispatch more then one action or chain events. 

### Library: Redux API Middleware

[redux-api-middleware](https://github.com/agraboso/redux-api-middleware)

This middleware receives Redux Standard API-calling Actions (RSAAs) and dispatches Flux Standard Actions (FSAs) to the next middleware.

RSAAs are identified by the presence of a `[CALL_API]` property, where `CALL_API` is a `Symbol` defined in, and exported by `redux-api-middleware`. They contain information describing an API call and three different types of FSAs, known as the *request*, *success* and *failure* FSAs.

> Usage example:

```Javascript
export const apiActionName = payload => (dispatch, getState) => (dispatch({
  [CALL_API]: {
    endpoint: '/api/v1/sample/' + payload.id,
    method: 'GET',
    types: ['REQUEST', 'SUCCESS', 'FAILURE'],
  }
}));
```

Events `['REQUEST', 'SUCCESS', 'FAILURE']` are dispatched during request.