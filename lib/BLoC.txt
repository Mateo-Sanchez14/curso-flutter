//Block pattern for state management in flutter using Streams

/*
BLoC (Business Logic Component) is a design pattern in Flutter that separates 
the business logic of an app from the user interface. It uses streams to communicate 
between the UI and the business logic, allowing for a clean separation of concerns 
and easier code maintenance. BLoC can be used in conjunction with the Provider 
package to manage the state of an app.

The BLoC pattern is based on the principles of the unidirectional data flow architecture
, which means that data flows in only one direction, from the source of truth (e.g. a repository)
to the UI. The BLoC pattern uses streams to handle the flow of data and to react to user actions.

In a Flutter app using the BLoC pattern, the UI listens to streams of data and events,
and the BLoC responds to user actions by adding new data or events to the streams.
The streams are managed by StreamControllers, which are part of the dart:async package.

The UI can update its state based on the data that it receives from the streams and the BLoC
can update the state of the app's data by adding new data to the streams.

It's a good practice to use the Provider package to manage the state of the BLoC and make
it available to the entire app. It's also a good practice to keep the BLoC as simple as possible,
with minimal or no direct reference to the UI.

Overall, BLoC pattern is a great way to manage state and handle user interactions in a Flutter app
 and it makes the code more maintainable and testable.
*/

