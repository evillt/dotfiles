set -gx PNPM_HOME $HOME/Library/pnpm $PNPM_HOME

if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
