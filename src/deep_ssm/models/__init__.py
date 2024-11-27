from .bci_models import GRUDecoder, ParrRNNDecoder

all_models = {
  "bci_gru" : GRUDecoder,
  "bci_parrrnn" : ParrRNNDecoder
}
