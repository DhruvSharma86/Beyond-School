# Development workflow

Beyond School 2.0 is authored primarily on Windows in `D:\Projects\Beyond-School`. Native iOS/iPadOS compilation and runtime validation take place on the college Mac, where Xcode and Swift Playgrounds are available.

## Windows workflow

1. Make and review changes in the Git repository on Windows.
2. Inspect the Git diff and commit approved changes locally.
3. Transfer the latest repository snapshot to the college Mac, normally by downloading the repository ZIP or copying an approved ZIP snapshot.

Do not commit credentials, tokens, private keys, or machine-specific settings. Do not make the repository public automatically.

## College Mac validation workflow

1. Extract the repository snapshot to a local folder.
2. Open `BeyondSchool2.swiftpm` inside the extracted repository directory using Xcode (or Swift Playgrounds when appropriate).
3. Select a compatible iOS/iPadOS 18+ simulator or device and build the app.
4. Run the app and verify the welcome screen, the two clearly non-playable preview cards, and the About the Prototype sheet.
5. Record the Xcode build result, runtime observations, and any errors in `BUILD_STATUS.md` or a reviewed follow-up change.

The Mac is used for validation, not for unreviewed or destructive repository changes. Native results must distinguish between code creation, successful compilation, and runtime verification.

## Mandatory end-of-task handoff

Complete this procedure after every implementation task:

1. Inspect the final Git diff.
2. Run the relevant available checks.
3. Update `BUILD_STATUS.md` with the current implementation and verification state.
4. Provide a concise handoff report containing:
   - Work completed.
   - Files changed.
   - Checks executed and actual results.
   - Known issues and remaining validation.
   - Current Git state.
   - Exact next step.
5. Explicitly identify anything that must be tested on the college Mac.

For substantial milestones, create a detailed handoff document under `Docs/Handoffs/`. For small changes, the final report and updated `BUILD_STATUS.md` are sufficient. Do not create lengthy, redundant handoff files for trivial changes.

## Local Git automation

`Git-Auto-Commit-Push.cmd` is a local Windows-only file. It is ignored by the repository-root `.gitignore`; do not recreate, modify, stage, or upload it as project work.
