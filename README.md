# Godot UI design

## How to install

Go to a github release, copy paste the addons folder to the demo folder. Restart godot editor.

## Introduction

this is a control list for replace godot control node.

The implementation style of the control is based on https://m3.material.io/components Style.

Two important implementations:
1. Dynamic colors
2. Elevated implementation

Please note that plugin dependencies https://github.com/rakugoteam/Godot-Material-Icons

## Plan
1. All current node base classes are buttons, which implement the functions of different controls in a certain way. However, due to not using Godot base controls, not all signals possessed by the base controls are implemented
2. The rendering of the control is only completed at runtime, so it cannot be displayed in real-time in the editor temporarily
3. Will implementing controls through gdscript affect fps

## Possible improvements
1. Move the code to the C++level and implement the signals possessed by the basic controls
2. The display of controls can be controlled through themes

## Available controls
1. Badge: ![image](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/ff6614d8-96a0-436c-b5e2-6ad1f6d6b271)
2. Button: ![video](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/06619c4c-8404-44f6-a24e-81818a12859b)
3. Fab: ![fab](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/6eedf918-fbf7-40ec-8148-1185fe542eae)
4. IconButton: ![icon_button](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/39c2a86f-d265-4382-b798-00f9470661da)
5. SegmentedButton: ![segmented_button](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/9b229bb1-9f17-459c-9c87-adb0dea97acd)
6. Card: ![card](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/d807bc20-382b-4bce-ab19-a89b48bb3eed)
7. Carousel: ![Carousel](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/6a237fe4-5ecf-4740-a732-5b0447a9fcd8)
8. CheckBox: ![CheckBox](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/11afe0e3-9df2-418f-a833-e6bac971cb2e)
9. CheckButton: ![CheckButton](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/6ba44393-f06d-4c40-8edf-49264d41dcce)
10. Chip: ![Chip](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/91709ba4-8c18-4ff6-870f-8a77f7f72292)
11. Dialog:
    1. BaseDialog: ![BaseDialog](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/0aee1541-d297-46e4-bebc-2d3b3f8ed9c5)
    2. FullScreenDialog: ![FullScreenDialog](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/1236d554-5f11-4f43-8b4f-d38d7a42067c)
12. Menu: ![Menu](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/0a866371-74fa-4bf5-ba77-3a4ddd649dd7)
13. ProgressIndicators: ![ProgressIndicators](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/0577551b-a2ef-44e3-98c7-a162606947b3)
14. Radio: ![Radio](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/5342abc2-2235-4ff6-9d93-d9d87e6058f6)
15. Search:
    1. SearchBar: ![SearchBar](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/a9451f2c-6f25-44c3-9423-8f26470e784e)
    2. SearchView: ![SearchView](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/7a63fac7-a993-4bc0-ac50-680a90b520de)
16. Separator:
    1. HSeparator: ![image](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/7025c7b1-76c4-44f7-949e-5adc70b85fa4)
    2. VSeparator: ![image](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/6cc64d2a-9bf2-41f5-a5ab-2500c116434f)
17. Slider: ![Slider](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/43f46a8b-64dd-4101-b728-5d3609d49db9)
18. SnackBar: ![Snackbar](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/2a81fa4b-466c-40de-b294-611a33133fcf)
19. Tab: ![Tab](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/02f20e61-a14c-44fa-a2ae-d83e4b36fe53)
20. TextField: ![TextField](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/7332a083-40ff-4fb4-acf8-cd7bb4ab4d73)
21. Tooltip: ![Tooltip](https://github.com/aiaimimi0920/godot-ui-design/assets/153103332/cd1c11d7-8044-42f8-b242-3f6b697ef568)


## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/aiaimimi0920"><img src="https://avatars.githubusercontent.com/u/153103332?v=4?s=100" width="100px;" alt="mimi"/><br /><sub><b>mimi</b></sub></a><br /><a href="https://github.com/aiaimimi0920/godot-tts/commits?author=aiaimimi0920" title="Code">💻</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
