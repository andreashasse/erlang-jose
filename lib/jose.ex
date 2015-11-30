defmodule JOSE do
  @moduledoc ~S"""
  JOSE stands for JSON Object Signing and Encryption which is a is a set of
  standards established by the [JOSE Working Group](https://datatracker.ietf.org/wg/jose).

  JOSE is split into 5 main components:

    * `JOSE.JWA` - JSON Web Algorithms (JWA) [RFC 7518](https://tools.ietf.org/html/rfc7518)
    * `JOSE.JWE` - JSON Web Encryption (JWE) [RFC 7516](https://tools.ietf.org/html/rfc7516)
    * `JOSE.JWK` - JSON Web Key (JWK)        [RFC 7517](https://tools.ietf.org/html/rfc7517)
    * `JOSE.JWS` - JSON Web Signature (JWS)  [RFC 7515](https://tools.ietf.org/html/rfc7515)
    * `JOSE.JWT` - JSON Web Token (JWT)      [RFC 7519](https://tools.ietf.org/html/rfc7519)

  Additional specifications and drafts implemented:

    * JSON Web Key (JWK) Thumbprint [RFC 7638](https://tools.ietf.org/html/rfc7638)
    * JWS Unencoded Payload Option  [draft-ietf-jose-jws-signing-input-options-04](https://tools.ietf.org/html/draft-ietf-jose-jws-signing-input-options-04)
  """

  ## Functions

  @doc """
  Gets the current Cryptographic Algorithm Fallback state, defaults to `false`.
  """
  defdelegate crypto_fallback(), to: :jose

  @doc """
  Sets the current Cryptographic Algorithm Fallback state.
  """
  defdelegate crypto_fallback(boolean), to: :jose

  @doc """
  Decode JSON to a term using the module returned by `json_module/0`.
  """
  defdelegate decode(binary), to: :jose

  @doc """
  Decode a term to JSON using the module returned by `json_module/0`.
  """
  defdelegate encode(term), to: :jose

  @doc """
  Gets the current JSON module used by `decode/1` and `encode/1`, see `json_module/1` for default.
  """
  defdelegate json_module(), to: :jose

  
  @doc """
  Sets the current JSON module used by `decode/1` and `encode/1`.

  Currently supported JSON modules (first found is used as default):

    * [`Poison`](https://github.com/devinus/poison)
    * [`jiffy`](https://github.com/davisp/jiffy)
    * [`jsone`](https://github.com/sile/jsone)
    * [`jsx`](https://github.com/talentdeficit/jsx)

  Additional modules that implement the `jose_json` behavior may also be used.
  """
  defdelegate json_module(module), to: :jose

  @doc """
  Gets the current Unsecured Signing state, defaults to `false`.
  """
  defdelegate unsecured_signing(), to: :jose

  @doc """
  Sets the current Unsecured Signing state.

  Enables/disables the `"none"` algorithm used for signing and verifying.

  See [Critical vulnerabilities in JSON Web Token libraries](https://auth0.com/blog/2015/03/31/critical-vulnerabilities-in-json-web-token-libraries/) for more information.
  """
  defdelegate unsecured_signing(boolean), to: :jose

end