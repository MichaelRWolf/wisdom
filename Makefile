# REPO is the absolute path to this Makefile's directory.
# $(CURDIR) is set by make to the directory passed via -C (or cwd if run directly),
# so this works whether invoked as 'make' or 'make -C /path/to/wisdom'.
REPO      := $(CURDIR)
CRON_SCHED = 0 23 * * *
CRON_CMD   = make -C $(REPO) commit-quotes

.PHONY: setup-hooks commit-quotes timestamp-quotes install install-quotes install-crontab show-crontab

setup-hooks:
	pre-commit install



commit-quotes: timestamp-quotes
	bin/commit-quotes

timestamp-quotes:
	bin/timestamp-quotes quotes.txt

install: install-quotes

install-quotes:
	@TARGET="$(REPO)/quotes.txt"; \
	LINK="$(HOME)/quotes.txt"; \
	if [ -L "$$LINK" ]; then \
	    CURRENT=$$(readlink "$$LINK"); \
	    if [ "$$CURRENT" = "$$TARGET" ]; then \
	        echo "install-quotes: verified $$LINK -> $$TARGET"; \
	    else \
	        echo "WARNING: $$LINK exists but points to $$CURRENT (expected $$TARGET)"; \
	    fi; \
	elif [ -e "$$LINK" ]; then \
	    echo "WARNING: $$LINK exists and is not a symlink — leaving it alone"; \
	else \
	    ln -s "$$TARGET" "$$LINK"; \
	    echo "install-quotes: created $$LINK -> $$TARGET"; \
	fi

# Install a nightly crontab entry (idempotent — safe to run multiple times).
# MAILTO="" suppresses all cron mail.
install-crontab:
	@if crontab -l 2>/dev/null | grep -qF '$(CRON_CMD)'; then \
	    echo "crontab: already scheduled — no change"; \
	else \
	    { crontab -l 2>/dev/null; \
	      echo 'MAILTO=""'; \
	      echo '$(CRON_SCHED) $(CRON_CMD)'; \
	    } | crontab -; \
	    echo "crontab: added  $(CRON_SCHED)  $(CRON_CMD)"; \
	fi

# Show whether the crontab entry is installed.
show-crontab:
	@crontab -l 2>/dev/null | grep -F '$(CRON_CMD)' \
	    && echo "(scheduled)" \
	    || echo "(not scheduled)"
