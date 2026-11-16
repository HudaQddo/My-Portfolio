# My Portfolio

The Flutter portfolio application is in [`frontend/`](frontend/).
See the [application README](frontend/README.md) for development resources.

## GitHub Pages deployment

Live website URL (after a successful deployment):
[https://hudaqddo.github.io/My-Portfolio/](https://hudaqddo.github.io/My-Portfolio/).

In the GitHub repository, open **Settings → Pages → Build and deployment**
and select **GitHub Actions** as the source. Repository Actions policies must
allow the actions used by `.github/workflows/deploy.yml`. If the `github-pages`
environment has deployment restrictions, allow the `main` branch.
No custom domain or personal access token is required.

Every push to `main` automatically builds the app with Flutter stable and
deploys only `frontend/build/web` to GitHub Pages. Source code stays on `main`;
generated build files should not be committed. To deploy future updates,
commit and push your source changes to `main`. You can also open **Actions →
Deploy Flutter Web to GitHub Pages → Run workflow** and select `main`.
Check that the workflow succeeds before considering the website deployed.

The workflow runs the following from `frontend/`:

```sh
flutter pub get
flutter build web --release --base-href "/My-Portfolio/"
```

For local validation, also run `flutter analyze` and `flutter test` from
`frontend/`. The HTML base placeholder is replaced during the build, so asset
paths must remain relative. Navigation uses Flutter's default hash URLs
(for example, `/My-Portfolio/#/projects/example`) so opening or refreshing a
detail page does not require server-side rewrites.
