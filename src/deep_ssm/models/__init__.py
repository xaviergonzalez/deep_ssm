from .bci_models import GRUDecoder, pRNNDecoder

all_models = {
  "bci_gru" : GRUDecoder,
  "bci_prnn" : pRNNDecoder
}
