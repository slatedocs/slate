#Sportmaster rendering layer
##Introduction

This project was bootstrapped with [Create React App](https://github.com/facebookincubator/create-react-app).

##Available scripts

In the project directory, you can run:

`npm start`

Runs the app in the development mode.
Open http://localhost:3000 to view it in the browser.

The page will reload if you make edits.
You will also see any lint errors in the console.

`npm run flow`

Typecheck a project without a persistent process. [Read more](##Flowtype).

`npm run styleguide-server`

Runs dev  server for **React Styleguidist** library. [Read more](##React Styleguidis).
 
`pm run styleguide-build`

Generate a static HTML style guide for **React Styleguidist** library.

##Folder structure

> Default folder structure:

```
    app/
      README.md
      node_modules/
      package.json
      .flowconfig
      .gitignore
    public/
      index.html
      favicon.ico
    flow-typed/
    src/
      actions/
      assets/
        styles/
          animations/
          base/
          mixins/
          partials/
        main.scss
      components/
      constants/
      containers/
        App.js
        DynamicRoute.js
      environments/
      reducers/
        Root.js
      routes/
        Root.js
      utilities/
      configureStore.js
      index.js
```

For the project to build, these files must exist with exact filenames:

    public/index.html is the page template;
    src/index.js is the JavaScript entry point.

**scr/actions:**

    Contains action creators for both API and internal requests.

Read more [here](##Action creators).

**scr/assets:**

    Contains all files for external usage.
    
**scr/assets/styles:**

    Directory dedicated for style style sheets.
    
**scr/assets/styles/main.scss:**

    Main style sheet entry point. This file must contain all accessible style sheets, otherwise react not gonna see it. 

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

##Action creators

###Library: Redux Thunk

[redux-trunk](https://github.com/gaearon/redux-thunk)

Redux Thunk [middleware](https://github.com/reactjs/redux/blob/master/docs/advanced/Middleware.md) allows you to write action creators that return a function instead of an action. The thunk can be used to delay the dispatch of an action, or to dispatch only if a certain condition is met. The inner function receives the store methods `dispatch` and `getState` as parameters.

> Usage example:

```Javascript
export const actionName = payload => (dispatch, getState) => {
  // Code goes here.
};
```

Also this enable to dispatch more then one action or chain events. 

###Library: Redux API Middleware

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

For reducer's action handles it is optional to use `BasicApiProcessor`, which supports defaul error handling and initial state.
 
> Usage example:

```Javascript
import { basicApiInitialState, basicApiProcessor } from '../utilities/BasicApiProcessor';
import { REQUEST, SUCCESS, FAILURE } from '../constants/Api';
// Have no idea how to make space...
const initialState = {
  ...basicApiInitialState,
  field: [],
};
const reducer = handleActions({
    [REDUCER_NAME_REQUEST]: (state, action) => ({
      ...state,
      ...basicApiProcessor(action, REQUEST),
      active: undefined,
    }),
    initialState
);

```

##Flowtype

Flow is a static type checker that helps you write code with fewer bugs. Check out this [introduction to using static types in JavaScript](https://medium.freecodecamp.com/why-use-static-types-in-javascript-part-1-8382da1e0adb#.ujt814w5o)
 if you are new to this concept.
 
To enable static type checking for file - add  `// @flow` at the first line of document. To define variable/function static type add `:` after it's name declaration.

> Usage example:

````Javascript
const foo = (x: string, y: number): number => ({
  x.length * y;
});
````

In case of ES6 `destructuring` parameters usage:

```Javascript
const foo = ({ x, y }: {x: string, y: number}): number => ({
    x.length * y;
});
```

To run assertations: `npm run flow`

Configuration file can be found in project root under name `.flowconfig` which enable include/exclude scpecific path or files, libs to add declarations and extra options. 
Custom types should all be declared in `flow-typed/types.js` and included by `import type { typeName } from 'sm-flow-types'

To learn more about Flow, check out [its documentation](https://flowtype.org/).

##React Styleguidis

All components should fallow this file structure:

```
    ComponentName/
        ComponentName.js
        index.js
        Readme.md
```

Where each component has its own folder which contains component declaration, universal export and style guide's markup. The `index.js` should contain 
`export { default } from './ComponentName.js';` and nothing more. The `Readme.md` supports markup and JSX element.

To create style guide simply run `npm run styleguide-server` and to build static html for it run `pm run styleguide-build`.

To learn more about Flow, check out [its documentation](https://github.com/styleguidist/react-styleguidist)
