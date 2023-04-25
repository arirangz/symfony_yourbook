<?php

namespace App\Controller\Admin;

use App\Entity\Livre;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class LivreCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Livre::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        yield from parent::configureFields($pageName);
        yield AssociationField::new('auteur');
        yield AssociationField::new('editeur');
        yield AssociationField::new('genres');

    }
    
}
