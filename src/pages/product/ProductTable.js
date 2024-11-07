import React, { useEffect } from "react";
import { Table } from "react-bootstrap";
import { useDispatch, useSelector } from "react-redux";
// import { getProductsAction } from "../ProductAction";
import { Link } from "react-router-dom";
import { getProductsAction } from "./ProductAction";

const ProductTable = () => {
  const dispatch = useDispatch();
  const { products } = useSelector((state) => state.product);

  useEffect(() => {
    dispatch(getProductsAction());
  }, [dispatch]);

  return (
    <Table striped bordered hover>
      <thead>
        <tr>
          <th>Name</th>
          <th>Price</th>
          <th>Product Link</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        {products.map((product) => (
          <tr key={product.slug}>
            <td>{product.name}</td>
            <td>{product.price}</td>
            <td>
              <a
                href={product.productLink}
                target="_blank"
                rel="noopener noreferrer"
              >
                {product.productLink}
              </a>
            </td>
            <td>
              <Link to={`/product/edit/${product.slug}`}>Edit</Link>
            </td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
};

export default ProductTable;
