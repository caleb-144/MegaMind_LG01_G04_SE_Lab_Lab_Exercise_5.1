# AI Usage Log

## 1. AI Tools Used

- **ChatGPT Codex** – Used to suggest improvements to the Flutter application.
- **Claude** – Used to give another opinion and suggest a different way to improve the code.

## 2. Refactoring Task

The task was to review and improve the overall `lib/` folder of the Student Management Application.

The main focus was on:
- `main.dart`
- Navigation Drawer
- Bottom Navigation
- Home Page
- Student Information Page
- Students Records Page
- Programme Page
- About Page
- `share_state_management.dart`

The goal was to make the code easier to understand, improve navigation and reduce unnecessary widget rebuilds.

## 3. AI Prompts Used

### 3.1 ChatGPT Codex

**Prompt:**

Review my Flutter Student Management Application and suggest improvements to the overall code structure, navigation, state management, null safety and widget rebuilds. Also suggest possible improvements for the existing pages.

**Suggestions:**
- Improve the navigation structure.
- Keep the code organised by separating widgets and pages.
- Avoid unnecessary widget rebuilds.
- Use proper null safety.
- Check that the pages work correctly with the navigation.

### 3.2 Claude

**Prompt:**

Review the overall Flutter Student Management Application and suggest improvements, especially for the Navigation Drawer, Bottom Navigation, Programme Page and `share_state_management.dart`.

**Suggestions:**
- Use Provider to manage the selected navigation index.
- Use `context.select` to reduce unnecessary rebuilds.
- Use `context.read` when updating the selected page.
- Keep Drawer items in one list to avoid repeated code.
- Improve the Programme Page layout using `ListView.builder` and const widgets.
- Update the widget tests to match the current application.

## 4. AI Tool Comparison

Requirements: ChatGPT Codex suggested improvements to the overall app structure and navigation. Claude focused more on using Provider to manage the navigation state.

Readability: ChatGPT Codex suggested separating the code into smaller parts. Claude suggested keeping Drawer items in one list to avoid repeating the same code.

Null Safety: ChatGPT Codex recommended using proper null safety and required parameters. Claude suggested using non-nullable values and avoiding unnecessary ! operators.

Widget Rebuilds: ChatGPT Codex suggested reducing unnecessary widget rebuilds. Claude recommended using context.select and context.read to make rebuilds more controlled.

Flutter Analysis: Neither tool's suggestions have been verified using flutter analyze.

Automated Tests: Neither tool ran flutter test, so the test results are still unknown.

Corrections Before Merging: ChatGPT's suggestions still need to be checked against the existing code. Claude's suggestions may require changes to the Provider setup and widget tests before they can be merged.

*Note: The AI tools did not run `flutter analyze` or `flutter test`, so the results are not confirmed.*

## 5. Final Evaluation and Decision

Both tools gave useful suggestions, but they had different approaches.

ChatGPT focused more on improving the general code structure, while Claude gave a more specific suggestion for managing navigation using Provider.

In my opinion, Claude's Provider approach is worth considering because the application already uses `share_state_management.dart`. However, the suggestions from both tools should be checked against the existing code before deciding what to implement.

## 6. Conclusion

Using both ChatGPT Codex and Claude helped me understand different ways to improve my Flutter application. Their suggestions gave me ideas about navigation, state management, code readability and widget rebuilds.

However, AI suggestions are not always correct, so the code still needs to be reviewed and tested before merging.
