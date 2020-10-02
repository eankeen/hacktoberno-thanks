# Hacktoberno-thanks

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

### `shouldCheckout`

**Optional** Whether we ourselves should checkout repo, or use a previous `actions/checkout` artifact. Currently has no effect

## Outputs

### `time`

The time we greeted you.

## Example usage

```yaml
uses: eankeen/hacktoberno-thanks@main
with:
   who-to-greet: 'Mona the Octocat'
```
