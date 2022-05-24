
import Prelude

import Cardano.Api

import System.Directory
import System.FilePath.Posix ((</>))

import PlutusExample.AlwaysFails (alwaysFailsScript)
import PlutusExample.AlwaysSucceeds (alwaysSucceedsScript)
import PlutusExample.CustomDatumRedeemerGuess
import PlutusExample.DatumRedeemerGuess (guessScript, guessScriptStake)
import PlutusExample.DeadlinePolicy (deadlineScript)
import PlutusExample.Loop (loopScript)
import PlutusExample.MintingScript (apiExamplePlutusMintingScript)
import PlutusExample.ScriptContextChecker
import PlutusExample.Sum (sumScript)
import PlutusExample.TokenNamePolicy (tokenNameScript)
import PlutusExample.WitnessPolicy (witnessScript)

main :: IO ()
main = do
  let dir = "generated-plutus-scripts"
  createDirectoryIfMissing False dir

  _ <- writeFileTextEnvelope (dir </> "always-fails.plutus") Nothing alwaysFailsScript
  _ <- writeFileTextEnvelope (dir </> "always-succeeds-spending.plutus") Nothing alwaysSucceedsScript
  _ <- writeFileTextEnvelope (dir </> "guess-42-datum-42-txin.plutus") Nothing guessScript
  _ <- writeFileTextEnvelope (dir </> "guess-42-stake.plutus") Nothing guessScriptStake
  _ <- writeFileTextEnvelope (dir </> "custom-guess-42-datum-42.plutus") Nothing customGuessScript
  _ <- writeFileTextEnvelope (dir </> "anyone-can-mint.plutus") Nothing apiExamplePlutusMintingScript
  _ <- writeFileTextEnvelope (dir </> "sum.plutus") Nothing sumScript
  _ <- writeFileTextEnvelope (dir </> "loop.plutus") Nothing loopScript
  _ <- writeFileTextEnvelope (dir </> "context-equivalance-test.plutus") Nothing scriptContextCheckScript
  _ <- writeFileTextEnvelope (dir </> "minting-context-equivalance-test.plutus") Nothing customApiExamplePlutusMintingScript
  _ <- writeFileTextEnvelope (dir </> "deadline-policy.plutus") Nothing deadlineScript
  _ <- writeFileTextEnvelope (dir </> "witness-policy.plutus") Nothing witnessScript
  _ <- writeFileTextEnvelope (dir </> "token-name-policy.plutus") Nothing tokenNameScript
  return ()
