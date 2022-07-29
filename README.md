# Star Rating UI Component

The task is to develop a star rating UI component, similar to the one you can see on the the App Store, when rating an app or on IMDB, when you rate a movie. This should be a reusable component that we could use in different places around our app.

## Requirements

- There needs to be a way to specify how many stars are shown in the component. For example for an app rating we want star rating of up to 5 stars, while for a movie rating we would choose an up to 10 star rating.
- There needs to be a way to read and write how many stars are selected.
- The component should have a way to inform a user of this component that the rating changed.

## Non-Requirements

Here's things that are explicitly not required in this assignment.

- There is no need for any styling configuration in this component. No custom, shape configuration or anything. Just what is required by the API – the number of stars and the number of selected stars. We just need to see if a star is selected or not.
- For simplicity you can assume that we will never have a star rating of more than 10 and never less than 3.

## Constraints

- Use UIKit, not SwiftUI.
- Don't use any 3rd party frameworks. These shouldn't be required anyway.
- Use Swift as your programming language.
