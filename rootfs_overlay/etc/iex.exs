NervesMOTD.print(
  logo: [
    IO.ANSI.color(5),
    """

                    ;kX'
                  ,0XXXl
                 xNXNNXX.
               'KNNXXXXX0.
              ;XNNNNNNNNN0.
             ;XNNNNNNNNNNNX:
            .XNNNXXXXXXXXXXXO.
            kNNNXNNNNXXNXXNNXNo
           .NNNXNNNNNXXNNXNNXXXO
           cXXXNNNNNNXXNNNNNNNNNd
           lNNNNNNNNNXXNXXXNNNNNK
           'NNXNXNXXXXXXXXXNNNNNk
            oNXNXXXXXNXXXNNNNXXX.
             :KXXXXXXNXXXNNNNXk.
               ;xXNXXXXNXXX0o.
                  .',::;,.

    """,
    IO.ANSI.reset(),
    """
          Elixir Circuits Quickstart

    All of the Elixir Circuits projects are available in this firmware
    image. See https://github.com/elixir-circuits/circuits_quickstart for
    more details.
    """
  ]
)

# Add Toolshed helpers to the IEx session
use Toolshed
