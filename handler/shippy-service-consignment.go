package handler

import (
	"context"
	"fmt"

	"go-micro.dev/v4/logger"

	pb "shippy-service-consignment/proto"
)

type ShippyServiceConsignment struct{}

func (e *ShippyServiceConsignment) CreateConsignment(ctx context.Context, req *pb.Consignment, rsp *pb.Response) error {
	logger.Infof("Received ShippyServiceConsignment.Call request: %v", req)

	fmt.Println("________________________________________________")
	fmt.Println("hi")
	fmt.Println(req.Id)

	fmt.Println("________________________________________________")
	rsp.Consignment = new(pb.Consignment)
	rsp.Consignment.Id = "122"

	return nil
}
