module Libcrux_ml_kem.Ind_cca.Instantiations.Neon.Unpacked
#set-options "--fuel 0 --ifuel 1 --z3rlimit 15"
open Core
open FStar.Mul

let _ =
  (* This module has implicit dependencies, here we make them explicit. *)
  (* The implicit dependencies arise from typeclasses instances. *)
  let open Libcrux_ml_kem.Hash_functions.Neon in
  let open Libcrux_ml_kem.Vector.Neon in
  ()

let encapsulate
      (v_K v_CIPHERTEXT_SIZE v_PUBLIC_KEY_SIZE v_T_AS_NTT_ENCODED_SIZE v_C1_SIZE v_C2_SIZE v_VECTOR_U_COMPRESSION_FACTOR v_VECTOR_V_COMPRESSION_FACTOR v_VECTOR_U_BLOCK_LEN v_ETA1 v_ETA1_RANDOMNESS_SIZE v_ETA2 v_ETA2_RANDOMNESS_SIZE:
          usize)
      (public_key:
          Libcrux_ml_kem.Ind_cca.Unpacked.t_MlKemPublicKeyUnpacked v_K
            Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector)
      (randomness: t_Array u8 (sz 32))
     =
  Libcrux_ml_kem.Ind_cca.Unpacked.encapsulate v_K v_CIPHERTEXT_SIZE v_PUBLIC_KEY_SIZE
    v_T_AS_NTT_ENCODED_SIZE v_C1_SIZE v_C2_SIZE v_VECTOR_U_COMPRESSION_FACTOR
    v_VECTOR_V_COMPRESSION_FACTOR v_VECTOR_U_BLOCK_LEN v_ETA1 v_ETA1_RANDOMNESS_SIZE v_ETA2
    v_ETA2_RANDOMNESS_SIZE #Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector
    #Libcrux_ml_kem.Hash_functions.Neon.t_Simd128Hash public_key randomness

let unpack_public_key
      (v_K v_T_AS_NTT_ENCODED_SIZE v_RANKED_BYTES_PER_RING_ELEMENT v_PUBLIC_KEY_SIZE: usize)
      (public_key: Libcrux_ml_kem.Types.t_MlKemPublicKey v_PUBLIC_KEY_SIZE)
      (unpacked_public_key:
          Libcrux_ml_kem.Ind_cca.Unpacked.t_MlKemPublicKeyUnpacked v_K
            Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector)
     =
  let hax_temp_output, unpacked_public_key:(Prims.unit &
    Libcrux_ml_kem.Ind_cca.Unpacked.t_MlKemPublicKeyUnpacked v_K
      Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector) =
    (),
    Libcrux_ml_kem.Ind_cca.Unpacked.unpack_public_key v_K
      v_T_AS_NTT_ENCODED_SIZE
      v_RANKED_BYTES_PER_RING_ELEMENT
      v_PUBLIC_KEY_SIZE
      #Libcrux_ml_kem.Hash_functions.Neon.t_Simd128Hash
      #Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector
      public_key
      unpacked_public_key
    <:
    (Prims.unit &
      Libcrux_ml_kem.Ind_cca.Unpacked.t_MlKemPublicKeyUnpacked v_K
        Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector)
  in
  unpacked_public_key

let decapsulate
      (v_K v_SECRET_KEY_SIZE v_CPA_SECRET_KEY_SIZE v_PUBLIC_KEY_SIZE v_CIPHERTEXT_SIZE v_T_AS_NTT_ENCODED_SIZE v_C1_SIZE v_C2_SIZE v_VECTOR_U_COMPRESSION_FACTOR v_VECTOR_V_COMPRESSION_FACTOR v_C1_BLOCK_SIZE v_ETA1 v_ETA1_RANDOMNESS_SIZE v_ETA2 v_ETA2_RANDOMNESS_SIZE v_IMPLICIT_REJECTION_HASH_INPUT_SIZE:
          usize)
      (key_pair:
          Libcrux_ml_kem.Ind_cca.Unpacked.t_MlKemKeyPairUnpacked v_K
            Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector)
      (ciphertext: Libcrux_ml_kem.Types.t_MlKemCiphertext v_CIPHERTEXT_SIZE)
     =
  Libcrux_ml_kem.Ind_cca.Unpacked.decapsulate v_K v_SECRET_KEY_SIZE v_CPA_SECRET_KEY_SIZE
    v_PUBLIC_KEY_SIZE v_CIPHERTEXT_SIZE v_T_AS_NTT_ENCODED_SIZE v_C1_SIZE v_C2_SIZE
    v_VECTOR_U_COMPRESSION_FACTOR v_VECTOR_V_COMPRESSION_FACTOR v_C1_BLOCK_SIZE v_ETA1
    v_ETA1_RANDOMNESS_SIZE v_ETA2 v_ETA2_RANDOMNESS_SIZE v_IMPLICIT_REJECTION_HASH_INPUT_SIZE
    #Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector
    #Libcrux_ml_kem.Hash_functions.Neon.t_Simd128Hash key_pair ciphertext

let generate_keypair
      (v_K v_CPA_PRIVATE_KEY_SIZE v_PRIVATE_KEY_SIZE v_PUBLIC_KEY_SIZE v_BYTES_PER_RING_ELEMENT v_ETA1 v_ETA1_RANDOMNESS_SIZE:
          usize)
      (randomness: t_Array u8 (sz 64))
      (out:
          Libcrux_ml_kem.Ind_cca.Unpacked.t_MlKemKeyPairUnpacked v_K
            Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector)
     =
  let hax_temp_output, out:(Prims.unit &
    Libcrux_ml_kem.Ind_cca.Unpacked.t_MlKemKeyPairUnpacked v_K
      Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector) =
    (),
    Libcrux_ml_kem.Ind_cca.Unpacked.generate_keypair v_K v_CPA_PRIVATE_KEY_SIZE v_PRIVATE_KEY_SIZE
      v_PUBLIC_KEY_SIZE v_BYTES_PER_RING_ELEMENT v_ETA1 v_ETA1_RANDOMNESS_SIZE
      #Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector
      #Libcrux_ml_kem.Hash_functions.Neon.t_Simd128Hash randomness out
    <:
    (Prims.unit &
      Libcrux_ml_kem.Ind_cca.Unpacked.t_MlKemKeyPairUnpacked v_K
        Libcrux_ml_kem.Vector.Neon.Vector_type.t_SIMD128Vector)
  in
  out
