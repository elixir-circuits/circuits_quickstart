import Config

Application.ensure_all_started(:logger_backends)
LoggerBackends.add(RingLogger)
