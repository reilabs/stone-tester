# CAIRO 1
~/.cargo/bin/cairo-compile --single-file one.cairo one.sierra --replace-ids
~/.cargo/bin/sierra-compile one.sierra one.casm
cairo1-run one.cairo \
    --trace_file=one.trace \
    --memory_file=one.memory \
    --air_public_input=one_public_input.json \
    --air_private_input=one_private_input.json \
    --layout plain \
    --proof_mode

cpu_air_prover \
    --out_file=one.proof \
    --private_input_file=one_private_input.json \
    --public_input_file=one_public_input.json \
    --prover_config_file=cpu_air_prover_config.json \
    --parameter_file=cpu_air_params.json

cpu_air_verifier --in_file=one.proof && echo "Successfully verified one.proof"

# CAIRO 0
. ${PYENV_ROOT}/versions/.venv/bin/activate
cairo-compile zero.cairo --output zero_compiled.json --proof_mode
cairo-run \
    --program=zero_compiled.json \
    --air_public_input=zero_public_input.json \
    --air_private_input=zero_private_input.json \
    --layout=plain \
    --trace_file=zero.trace \
    --memory_file=zero.memory \
    --proof_mode

cpu_air_prover \
    --out_file=zero.proof \
    --private_input_file=zero_private_input.json \
    --public_input_file=zero_public_input.json \
    --prover_config_file=cpu_air_prover_config.json \
    --parameter_file=cpu_air_params.json

cpu_air_verifier --in_file=zero.proof && echo "Successfully verified zero.proof"
