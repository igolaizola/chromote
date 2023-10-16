package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"os/signal"

	"github.com/chromedp/chromedp"
)

func main() {
	ctx, cancel := signal.NotifyContext(context.Background(), os.Interrupt)
	defer cancel()

	if err := run(ctx, "http://localhost:9222"); err != nil {
		log.Fatal(err)
	}
	log.Println("success")
}

func run(ctx context.Context, remote string) error {
	ctx, cancel := chromedp.NewRemoteAllocator(ctx, remote)
	defer cancel()

	// create chrome instance
	ctx, cancel = chromedp.NewContext(ctx)
	defer cancel()

	// check if headless
	if err := chromedp.Run(ctx,
		chromedp.Navigate("https://intoli.com/blog/not-possible-to-block-chrome-headless/chrome-headless-test.html"),
	); err != nil {
		return fmt.Errorf("could not navigate to test page: %w", err)
	}
	return nil
}
